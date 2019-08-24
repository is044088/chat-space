class UsersController < ApplicationController
  def index
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%")

    respond_to do |format|
      format.json
      format.html
    end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end

 # @users = User.where("name LIKE(?) and id != ?", "#{params[:keyword]}%", current_user.id).where.not(id: params["arr"].map{ |item| item.to_i })
  #  ・["arr"]←idが格納されている配列
  #  ・.map←要素の数だけ繰り返しブロックを実行し、ブロックの戻り値を集めた配列を作成して返す。
  #  ・.to_i←文字列型からint型に変換する。
