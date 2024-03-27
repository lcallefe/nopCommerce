class Conta
  attr_accessor :saldo, :valor, :limite, :mensagem

  def initialize(saldo, valor, limite, mensagem = "")
    @saldo = saldo
    @valor = valor
    @limite = limite
    @mensagem = mensagem
  end


  def saca
    case
      when @saldo < @valor && @valor <= @limite then @mensagem = 'Saldo insuficiente'
      when @valor > @limite then @mensagem = 'Saque maior que limite'
      else  @saldo -= @valor
    end
  end
end  

class ContaCorrente < Conta
  def initialize(saldo, valor)
    super(saldo, valor, 2000.0, mensagem)
  end
end


class ContaPoupanca < Conta
  def initialize(saldo, valor)
    super(saldo, valor, 700.0, mensagem)
  end
end
 