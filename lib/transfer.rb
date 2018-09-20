class Transfer

 attr_accessor :sender, :receiver, :status, :amount

 def initialize(bank1, bank2, amount)
   @sender = bank1
   @receiver = bank2
   @amount = amount
   @status = "pending"
 end

 def valid?
   if @sender.valid? == true && @receiver.valid? == true
     true
   else
     false
   end
 end

 def execute_transaction
   if @sender.valid? == true && @amount < @sender.balance
     @sender.deposit(-@amount)
     @receiver.deposit(@amount)
     @status = "complete"
     @temp = @amount
     @amount = 0
   else
     @status = "rejected"
     return "Transaction rejected. Please check your account balance."
   end
 end

 def reverse_transfer
   if @status == "complete"
     @sender.deposit(@temp)
     @receiver.deposit(-@temp)
     @status = "reversed"
     end
   end

end
