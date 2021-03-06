class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    if customer.update(customer_params)
      redirect_to customers_path
    else
      redirect_to request.referer
    end
  end

  def quit
    @customer = current_customer
  end

  def out
    customer = current_customer
    if customer.update(is_deleted: true)
      reset_session
      redirect_to root_path
    end    
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, 
                                     :first_name, 
                                     :last_name_kana, 
                                     :first_name_kana, 
                                     :postal_code, 
                                     :address, 
                                     :phone_number, 
                                     :email, 
                                     :is_deleted
                                    )
  end
  
end
