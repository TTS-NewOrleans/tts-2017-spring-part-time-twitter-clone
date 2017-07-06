class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:show, :edit, :update]

  def index
    @tweets = Tweet.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was updated.' }
      else
        format.html { render :edit }
      end # end if
    end # end do
  end # end update

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|

      if @tweet.save
        format.html { redirect_to @tweet, notice: 'You just tweeted.' }
      else
        format.html { render :new }
      end # end of if statement

    end # end of do

  end # end of create action


  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end

end #End of the TweetsController














