describe ContaCorrente do
  describe 'Saque' do
    context 'quando o valor é positivo' do
      before(:all) do
        conta = ContaCorrente.new(1000.00)
        conta.saca(200)
      end

      it 'então atualiza saldo' do
        expect(conta.saldo).to eql 800.00

      end
    end 
  end
end
