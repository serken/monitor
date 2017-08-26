class WidgetsController < ApplicationController
  before_action :set_widget, only: [:show, :edit, :update, :destroy]
  before_action :set_dashboard

  # GET /widgets
  # GET /widgets.json
  def index
    @widgets = Widget.all
  end

  # GET /widgets/1
  # GET /widgets/1.json
  def show
  end

  # GET /widgets/new
  def new
    @widget = Widget.new
  end

  # GET /widgets/1/edit
  def edit
    render partial: 'form'
  end

  # POST /widgets
  # POST /widgets.json
  def create
    @widget = @dashboard.widgets.new(widget_params)

    respond_to do |format|
      if @widget.save
        format.html { redirect_to @dashboard, notice: 'Widget was successfully created.' }
        format.json { render :show, status: :created, location: @widget }
      else
        format.html { render :new }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /widgets/1
  # PATCH/PUT /widgets/1.json
  def update
    respond_to do |format|
      if @widget.update(widget_params)
        format.html { redirect_to @dashboard, notice: 'Widget was successfully updated.' }
        format.json { render :show, status: :ok, location: @widget }
      else
        format.html { render :edit }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /widgets/1
  # DELETE /widgets/1.json
  def destroy
    @widget.destroy
    respond_to do |format|
      format.html { redirect_to widgets_url, notice: 'Widget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_widget
      @widget = Widget.find(params[:id])
    end

    def set_dashboard
      @dashboard = Dashboard.find(params[:dashboard_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def widget_params
      pos_x, pos_y = params[:widget].slice(:pos_x, :pos_y).values
      if pos_x
        params[:widget][:pos_x] = @widget.pos_x.to_i + pos_x.to_i
      end
      if pos_y
        params[:widget][:pos_y] = @widget.pos_y.to_i + pos_y.to_i
      end
      params.require(:widget).permit(:id, :name, :code, :scale_x, :scale_y, :pos_x, :pos_y, :width, :height)
    end
end
