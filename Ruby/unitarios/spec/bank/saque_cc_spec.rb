require_relative '../../app/bank'

describe ContaCorrente do
  describe 'Saque' do
    context 'quando o saldo é positivo' do
      before(:all) do
        @cc = ContaCorrente.new 1000.00, 200.00
        @cc.saca
      end

      it 'então atualiza saldo' do
        expect(@cc.saldo).to eql 800.00
      end
    end 

    context 'quando o saldo é zero' do
      before(:all) do
        @cc = ContaCorrente.new 0.00, 0.01
        @cc.saca
      end

      it 'então saldo permanece com 0' do
        expect(@cc.saldo).to eql 0.00
      end
    end 

    context 'quando o saldo é insuficiente' do
      before(:all) do
        @cc = ContaCorrente.new 999.99, 1000.00
        @cc.saca
      end

      it 'então atualiza saldo' do
        expect(@cc.saldo).to eql 999.99
        expect(@cc.mensagem).to eql 'Saldo insuficiente'
      end
    end 

    context 'quando o saque é maior que o limite de transação' do
      before(:all) do
        @cc = ContaCorrente.new 2000.02, 2000.01
        @cc.saca
      end

      it 'então atualiza saldo' do
        expect(@cc.saldo).to eql 2000.02
        expect(@cc.mensagem).to eql 'Saque maior que limite'
      end
    end 
  end
end
