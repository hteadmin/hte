class OrdersController < ApplicationController

  def show
    @order = Order.find_by_number(params[:id])
    render layout: 'simple'
  end

  def hop_dong
    @order = Order.find_by_number(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ContractPdf.new(@order)
        send_data pdf.render, filename: "Hop Dong #{@order.number}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

end