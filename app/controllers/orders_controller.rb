class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = current_user.orders
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order_items = @order.order_items
  end

  # GET /orders/new
  def new
    redirect_to new_user_address_path(current_user)  unless current_user.addresses.any?
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @order.status = 1
    @order.update_attributes({:status=>1})
    flash[:success] = 'Order has been Finished!'
    redirect_to @order
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_user.orders.build(order_params)
    @order.status = 0
    @order.save
    if @order.save
      sign_in current_user
      flash[:success] = "Order has submitted!"
    else
      render 'new'
    end

    current_user.carts.each do |t|
      @item = @order.order_items.new
      @item.order = @order
      @item.product = t.product
      @item.num = t.num
      @item.save
    end

    current_user.carts.destroy_all
    redirect_to current_user
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    flash[:success] = 'Order was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:id, :address)
    end
end
