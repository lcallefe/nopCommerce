class ContaCorrente
  attr_accessor :saldo, :valor, :limite, :mensagem

  def initialize(saldo, valor, limite, mensagem = "")
    @saldo = saldo
    @valor = valor
    @limite = limite
    @mensagem = mensagem
  end


  def saca
    case
      when @saldo < @valor then @mensagem = 'Saldo insuficiente'
      when @valor > @limite then @mensagem = 'Saque maior que limite'
      else  @saldo -= @valor
    end
  end

end  

describe ContaCorrente do
  describe 'Saque' do
    context 'quando o saldo é positivo' do
      before(:all) do
        @conta = ContaCorrente.new 1000.00, 200.00, 200.00
        @conta.saca
      end

      it 'então atualiza saldo' do
        expect(@conta.saldo).to eql 800.00
      end
    end 

    context 'quando o saldo é zero' do
      before(:all) do
        @conta = ContaCorrente.new 0.00, 0.01, 0.01
        @conta.saca
      end

      it 'então saldo permanece com 0' do
        expect(@conta.saldo).to eql 0.00
      end
    end 

    context 'quando o saldo é insuficiente' do
      before(:all) do
        @conta = ContaCorrente.new 999.99, 1000.00, 1000.00
        @conta.saca
      end

      it 'então atualiza saldo' do
        expect(@conta.saldo).to eql 999.99
        expect(@conta.mensagem).to eql 'Saldo insuficiente'
      end
    end 

    context 'quando o saque é maior que o limite de transação' do
      before(:all) do
        @conta = ContaCorrente.new 1000.00, 700.01, 700.00
        @conta.saca
      end

      it 'então atualiza saldo' do
        expect(@conta.saldo).to eql 1000.00
        expect(@conta.mensagem).to eql 'Saque maior que limite'
      end
    end 
  end
end
