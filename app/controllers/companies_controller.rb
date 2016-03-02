class CompaniesController < ApplicationController
    def new
        @company = Company.new
        @currency_array = [["USD", 1], ["RMB", 2], ["NTD", 3]]
        @stock_class_array = [["A股", 1], ["B股", 2], ["大屁股", 3]]
        
        @company_hash = {'Chinese' => :name_zh,
                        'English' => :name_en,
                        'Ein'     => :ein,
                        'Phone'   => :phone,
                        'Address' => :address }
        @staff_hashes = ['Chairan' => {'name' => :chairman_name, 'passport' => :chairman_passport, 'email' => :chairman_email},
                       'CEO' => {'name' => :ceo_name, 'passport' => :ceo_passport, 'email' => :ceo_email},
                       'CFO' => {'name' => :cfo_name, 'passport' => :cfo_passport, 'email' => :cfo_email}]
        @bank_hashes = [
            {'title'=> '匯款帳戶資訊 - 美金',
             'bank' => :us_account_bank,
             'num'  => :us_account_num,
             'name' => :us_account_name,
             'address' => :us_account_bank_addr},
            {'title'=> '匯款帳戶資訊 - 人民幣',
             'bank' => :cn_account_bank,
             'num'  => :cn_account_num,
             'name' => :cn_account_name,
             'address' => :cn_account_bank_addr},
            {'title'=> '匯款帳戶資訊 - 台幣',
             'bank' => :tw_account_bank,
             'num'  => :tw_account_num,
             'name' => :tw_account_name,
             'address' => :tw_account_bank_addr}
        ]
    end
    
    def create
        
        @company = Company.create(company_params)
   
        puts @company.inspect
        @identity = Identity.new(:company_id => @company.id, :stockholder_id => nil)
        
        if @company.save and @identity.save
          
          redirect_to root_path
        else
          render 'new'
        end
    end
    
    private
    def company_params
        params.require(:company).permit(:name_zh, :name_en, :ein, :phone, :address, :chairman_name, :chairman_passport, :chairman_email, :cfo_name, :cfo_passport,
                                        :cfo_email, :ceo_name, :ceo_passport, :ceo_email, :accounting_name, :accounting_passport, :accounting_email, :registered_agent_name,
                                        :registered_agent_passport, :registered_agent_email, :us_account_bank, :us_account_num, :us_account_name, :us_account_bank_addr,
                                        :cn_account_bank, :cn_account_num, :cn_account_name, :cn_account_bank_addr, :tw_account_bank, :tw_account_num, :tw_account_name,
                                        :tw_account_bank_addr, :date_establish, :date_accounting, :fund, :currency, :stock_class, :stock_price, :stock_num)
    end
end
