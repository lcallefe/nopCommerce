class ContaCorrente
  attr_accessor :saldo

  def initialize(saldo, valor = 0.0)
    @saldo = saldo
    @valor = valor
  end


  def saca
    @saldo -= @valor
  end
end  



describe ContaCorrente do
  describe 'Saque' do
    context 'quando o valor é positivo' do
      before(:all) do
        @conta = ContaCorrente.new 1000.00, 200.00
        @conta.saca
      end

      it 'então atualiza saldo' do
        p @conta
        expect(@conta.saldo).to eql 800.00
      end
    end 
  end
end
