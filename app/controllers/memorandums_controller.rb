class MemorandumsController < ApplicationController
  def index
    #@memorandums = Memorandum.all
    #@memorandums = Memorandum.order('id DESC')
    @memorandums = Memorandum.order('id DESC').all.page(params[:page])
    @memorandum = Memorandum.new
  end

  def show
    @memorandum = Memorandum.find(params[:id])
    #/messages/2 と言った URL にアクセスされたときに、 
    #params[:id] = 2 として代入される
  end

  def new
    @memorandum = Memorandum.new
  end

  def create
    
      @memorandum = Memorandum.new(memorandum_params)

    if @memorandum.save
      flash[:success] = 'メモ が正常に投稿されました'
      redirect_to memorandums_path
      
    else
      flash[:danger] = 'メモ が投稿されませんでした'
      redirect_to memorandums_path
    end
  end

  def edit
    @memorandum = Memorandum.find(params[:id])
  end

  def update
    @memorandum = Memorandum.find(params[:id])

    if @memorandum.update(memorandum_params)
      flash[:success] = 'メモは正常に更新されました'
      redirect_to @memorandum
    else
      flash.now[:danger] = 'メモは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @memorandum = Memorandum.find(params[:id])
    @memorandum.destroy

    flash[:success] = 'メモは正常に削除されました'
    redirect_to memorandums_url
  end
  
  private

  # Strong Parameter
  def memorandum_params
    params.require(:memorandum).permit(:content)
  end
  
end
