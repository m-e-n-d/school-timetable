class PeriodsController < ApplicationController
  before_action :set_period, only: [:show, :edit, :update, :destroy]

  # GET /periods
  # GET /periods.json
  def index
    @periods = Period.all
    @user = current_user
  end

  # GET /periods/1
  # GET /periods/1.json
  def show
  end

  # GET /periods/new
  def new
    @period = Period.new
    @target_weekday = conv_week_eng_to_jpn(params[:weekday])
    @target_period_num = params[:period_num]
    @user = current_user
  end

  # GET /periods/1/edit
  def edit
    @user = current_user
    period = Period.find(params[:id])
    @target_weekday = period.weekday
    @target_period_num = period.period_num
  end

  # POST /periods
  # POST /periods.json
  def create
    @period = Period.new(period_params)

    respond_to do |format|
      if @period.save
        format.html {
          @user = current_user
          redirect_to periods_path
        }
        format.json { render :show, status: :created, location: @period }
      else
        format.html { render :new }
        format.json { render json: @period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /periods/1
  # PATCH/PUT /periods/1.json
  def update
    @user = current_user
    respond_to do |format|
      if @period.update(period_params)
        format.html { redirect_to periods_path }
        format.json { render :show, status: :ok, location: @period }
      else
        format.html { render :edit }
        format.json { render json: @period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /periods/1
  # DELETE /periods/1.json
  def destroy
    @period.destroy
    respond_to do |format|
      format.html { redirect_to periods_url, notice: 'Period was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_period
      @period = Period.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def period_params
      params.require(:period).permit(:weekday, :subject, :period_num, :user_id)
    end

    # 英語の曜日表記を日本語の表記に変える関数
    # "mon" -> "月"
    def conv_week_eng_to_jpn(eng_weekday)
      case eng_weekday
      when "mon"
        "月"
      when "tue"
        "火"
      when "wed"
        "水"
      when "thu"
        "木"
      when "fri"
        "金"
      when "sat"
        "土"
      when "sun"
        "日"
      end 
    end
end
