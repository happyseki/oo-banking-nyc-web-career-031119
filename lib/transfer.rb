require_relative './bank_account.rb'
class Transfer
  # your code here
attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
     sender.valid?  && receiver.valid? 
  end

def execute_transaction
  if sender.valid? &&  sender.balance > amount && @status =="pending"
    sender.balance -= @amount
    receiver.balance += @amount
    @status = "complete"
  else
     @status = "rejected"
     "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if @status == "complete"
  sender.balance += @amount
  receiver.balance -= @amount
   @status = "reversed"
 end
end

end
