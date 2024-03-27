require_relative '../../app/bank'

describe ContaPoupanca do
  describe 'Saque' do
    context 'quando o saldo é positivo' do
      before(:all) do
        @cp = ContaPoupanca.new 700.00, 200.00
        @cp.saca
      end

      it 'então atualiza saldo' do
        expect(@cp.saldo).to eql 500.00
      end
    end 

    context 'quando o saldo é zero' do
      before(:all) do
        @cp = ContaPoupanca.new 0.00, 0.01
        @cp.saca
      end

      it 'então saldo permanece com 0' do
        expect(@cp.saldo).to eql 0.00
      end
    end 

    context 'quando o saldo é insuficiente' do
      before(:all) do
        @cp = ContaPoupanca.new 699.99, 700.00
        @cp.saca
      end

      it 'então atualiza saldo' do
        expect(@cp.saldo).to eql 699.99
        expect(@cp.mensagem).to eql 'Saldo insuficiente'
      end
    end 

    context 'quando o saque é maior que o limite de transação' do
      before(:all) do
        @cp = ContaPoupanca.new 700.00, 700.01
        @cp.saca
      end

      it 'então atualiza saldo' do
        expect(@cp.saldo).to eql 700.00
        expect(@cp.mensagem).to eql 'Saque maior que limite'
      end
    end 
  end
end
