unless AdminUser.count.positive?
  AdminUser.create!(email: 'fabricio.bizotto@gmail.com',
                    password: '22527662',
                    password_confirmation: '22527662')
end

unless Beer.count.positive?
  Beer.create!(name: 'Skol', abv: 1.5)
  Beer.create!(name: 'Heineken', abv: 4.5)
  Beer.create!(name: 'Skin', abv: 1.5)
  Beer.create!(name: 'Sol', abv: 1.5)
  Beer.create!(name: 'Bud', abv: 2.0)
end

unless Lancamento.count.positive?
  lancamento = Lancamento.find_or_create_by!(
    title: 'Testando...',
    dtlcto: Time.now,
    dtpgto: Time.now,
    vllcto: 10.00,
    vlpgto: 10.00,
    category: Category.where(user: User.first).first,
    account: Account.where(user: User.first).first,
    user: User.first,
    pagar: false
  )
  lancamento.update(tags: Tag.all) if lancamento.save!

end

unless Category.count.positive?
  begin
    Category.create(title: 'Receitas', active: true, user: User.first)
    Category.create(title: 'Salários e Ordenados', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Serhmática - Salário Líquido', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: '13 Salário', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Férias', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Mercado', active: true, user: User.first)
    Category.create(title: 'Alimentação', active: true,
                    category: Category.find_or_create_by!(title: 'Mercado'), user: User.first)
    Category.create(title: 'Bebidas', active: true,
                    category: Category.find_or_create_by!(title: 'Mercado'), user: User.first)
    Category.create(title: 'Receitas Financeiras', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Rendimentos poupança', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas Financeiras'), user: User.first)
    Category.create(title: 'Rendimento Aplicações Financeiras', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas Financeiras'), user: User.first)
    Category.create(title: 'Saúde', active: true, user: User.first)
    Category.create(title: 'Plano de Saúde', active: true,
                    category: Category.find_or_create_by!(title: 'Saúde'), user: User.first)
    Category.create(title: 'Vestuário', active: true, user: User.first)
    Category.create(title: 'Roupas e Acessórios', active: true,
                    category: Category.find_or_create_by!(title: 'Vestuário'), user: User.first)
    Category.create(title: 'Doação', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Cartão de Crédito', active: true,
                    category: Category.find_or_create_by!(title: 'Outros'), user: User.first)
    Category.create(title: 'Acerto de Saldo', active: true, user: User.first)
    Category.create(title: 'Combustível', active: true, user: User.first)
    Category.create(title: 'Combustível - Carro', active: true,
                    category: Category.find_or_create_by!(title: 'Combustível'), user: User.first)
    Category.create(title: 'Combustível - Moto', active: true,
                    category: Category.find_or_create_by!(title: 'Combustível'), user: User.first)
    Category.create(title: 'Alimentação', active: true, user: User.first)
    Category.create(title: 'Restaurante', active: true,
                    category: Category.find_or_create_by!(title: 'Alimentação'), user: User.first)
    Category.create(title: 'Restaurante', active: true, user: User.first)
    Category.create(title: 'Farmácia', active: true,
                    category: Category.find_or_create_by!(title: 'Saúde'), user: User.first)
    Category.create(title: 'Manutenção de Veículo', active: true,
                    category: Category.find_or_create_by!(title: 'VEICULOS'), user: User.first)
    Category.create(title: 'Manutenção de Veículo - Automóvel', active: true,
                    category: Category.find_or_create_by!(title: 'Manutenção de Veículo'), user: User.first)
    Category.create(title: 'Manutenção de Veículo - Moto', active: true,
                    category: Category.find_or_create_by!(title: 'Manutenção de Veículo'), user: User.first)
    Category.create(title: 'Despesas Bancárias', active: true, user: User.first)
    Category.create(title: 'Manutenção da Conta', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas Bancárias'), user: User.first)
    Category.create(title: 'Juros e Taxas', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas Bancárias'), user: User.first)
    Category.create(title: 'Sobradinho', active: true, user: User.first)
    Category.create(title: 'Sobradinho - Manutenções Diversas', active: true,
                    category: Category.find_or_create_by!(title: 'Sobradinho'), user: User.first)
    Category.create(title: 'Alimentação', active: false,
                    category: Category.find_or_create_by!(title: 'Mercado'), user: User.first)
    Category.create(title: 'Telefonia', active: true, user: User.first)
    Category.create(title: 'Internet', active: true,
                    category: Category.find_or_create_by!(title: 'Telefonia'), user: User.first)
    Category.create(title: 'Internet fibra óptica', active: true,
                    category: Category.find_or_create_by!(title: 'Internet'), user: User.first)
    Category.create(title: 'Celular', active: true,
                    category: Category.find_or_create_by!(title: 'Telefonia'), user: User.first)
    Category.create(title: 'Sobradinho - Água', active: true,
                    category: Category.find_or_create_by!(title: 'Sobradinho'), user: User.first)
    Category.create(title: 'Sobradinho - Luz', active: true,
                    category: Category.find_or_create_by!(title: 'Sobradinho'), user: User.first)
    Category.create(title: 'Lazer', active: true, user: User.first)
    Category.create(title: 'Futebol', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'TV a Cabo', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Impostos', active: true, user: User.first)
    Category.create(title: 'IOF', active: true,
                    category: Category.find_or_create_by!(title: 'Impostos'), user: User.first)
    Category.create(title: 'Eletrônicos', active: true, user: User.first)
    Category.create(title: 'Jogos', active: true,
                    category: Category.find_or_create_by!(title: 'Eletrônicos'), user: User.first)
    Category.create(title: 'Eletrônicos - Diversos', active: true,
                    category: Category.find_or_create_by!(title: 'Eletrônicos'), user: User.first)
    Category.create(title: 'Outros', active: true, user: User.first)
    Category.create(title: 'Loteria/Megasena', active: true,
                    category: Category.find_or_create_by!(title: 'Outros'), user: User.first)
    Category.create(title: 'Educação', active: true, user: User.first)
    Category.create(title: 'Concursos', active: true,
                    category: Category.find_or_create_by!(title: 'Educação'), user: User.first)
    Category.create(title: 'Sobradinho - Material de Construção', active: true,
                    category: Category.find_or_create_by!(title: 'Sobradinho'), user: User.first)
    Category.create(title: 'Sobradinho - Impostos', active: true,
                    category: Category.find_or_create_by!(title: 'Sobradinho'), user: User.first)
    Category.create(title: 'Gastos Pessoais', active: true, user: User.first)
    Category.create(title: 'Presente', active: true,
                    category: Category.find_or_create_by!(title: 'Gastos Pessoais'), user: User.first)
    Category.create(title: 'Padaria', active: true,
                    category: Category.find_or_create_by!(title: 'Mercado'), user: User.first)
    Category.create(title: 'Manutenção de Equipamentos', active: true,
                    category: Category.find_or_create_by!(title: 'Eletrônicos'), user: User.first)
    Category.create(title: 'Cabeleireiro', active: true,
                    category: Category.find_or_create_by!(title: 'Gastos Pessoais'), user: User.first)
    Category.create(title: 'Sobradinho - Móveis e Utensílios', active: true,
                    category: Category.find_or_create_by!(title: 'Sobradinho'), user: User.first)
    Category.create(title: 'Serviços Gerais', active: true, user: User.first)
    Category.create(title: 'Manutenção de Equipamentos/Computadores', active: true,
                    category: Category.find_or_create_by!(title: 'Serviços Gerais'), user: User.first)
    Category.create(title: 'Mercado - Diversos', active: true,
                    category: Category.find_or_create_by!(title: 'Mercado'), user: User.first)
    Category.create(title: 'Parcelas Financiamento', active: true,
                    category: Category.find_or_create_by!(title: 'Financiamento do Imóvel'), user: User.first)
    Category.create(title: 'Consórcio', active: true, user: User.first)
    Category.create(title: 'Consórcio - Parcela', active: true,
                    category: Category.find_or_create_by!(title: 'Consórcio'), user: User.first)
    Category.create(title: 'Fixo', active: true,
                    category: Category.find_or_create_by!(title: 'Telefonia'), user: User.first)
    Category.create(title: 'Transferência', active: true, user: User.first)
    Category.create(title: 'Mercado', active: true, user: User.first)
    Category.create(title: 'Alimentação', active: true,
                    category: Category.find_or_create_by!(title: 'Mercado'), user: User.first)
    Category.create(title: 'Multas', active: true,
                    category: Category.find_or_create_by!(title: 'Impostos'), user: User.first)
    Category.create(title: 'Mercado', active: true, user: User.first)
    Category.create(title: 'Alimentação', active: true,
                    category: Category.find_or_create_by!(title: 'Mercado'), user: User.first)
    Category.create(title: 'Produtos de Limpeza', active: true,
                    category: Category.find_or_create_by!(title: 'Mercado'), user: User.first)
    Category.create(title: 'Receitas', active: true, user: User.first)
    Category.create(title: 'Salários e Ordenados', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Salário Líquido - Sicoob', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'PIS', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: '13º Salário', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Estorno', active: true,
                    category: Category.find_or_create_by!(title: 'Impostos'), user: User.first)
    Category.create(title: 'Receitas', active: true, user: User.first)
    Category.create(title: 'Salários e Ordenados', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Salário Líquido', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Férias', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Décimo Terceiro', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Despesas', active: true, user: User.first)
    Category.create(title: 'Veículo', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Manutenção de Veículo', active: true, user: User.first)
    Category.create(title: 'Combustível', active: true,
                    category: Category.find_or_create_by!(title: 'Veículo'), user: User.first)
    Category.create(title: 'Financiamento do Imóvel', active: true,
                    category: Category.find_or_create_by!(title: 'Sobradinho'), user: User.first)
    Category.create(title: 'Cartão de Credito', active: true, user: User.first)
    Category.create(title: 'Banco do Brasil', active: true,
                    category: Category.find_or_create_by!(title: 'Cartão de Credito'), user: User.first)
    Category.create(title: 'Sicoob', active: true,
                    category: Category.find_or_create_by!(title: 'Cartão de Credito'), user: User.first)
    Category.create(title: 'Faculdade', active: true, user: User.first)
    Category.create(title: 'Emprestimos', active: true, user: User.first)
    Category.create(title: 'Banco do Brasil', active: true,
                    category: Category.find_or_create_by!(title: 'Emprestimos'), user: User.first)
    Category.create(title: 'Sicoob', active: true,
                    category: Category.find_or_create_by!(title: 'Emprestimos'), user: User.first)
    Category.create(title: 'Moto', active: true, user: User.first)
    Category.create(title: 'Gasolina', active: true,
                    category: Category.find_or_create_by!(title: 'Moto'), user: User.first)
    Category.create(title: 'Óleo', active: true, category: Category.find_or_create_by!(title: 'Moto'),
                    user: User.first)
    Category.create(title: 'Mensalidade', active: true,
                    category: Category.find_or_create_by!(title: 'Faculdade'), user: User.first)
    Category.create(title: 'Gasolina', active: true,
                    category: Category.find_or_create_by!(title: 'Faculdade'), user: User.first)
    Category.create(title: 'Adiantamento de Salario Sicoob', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Ajuste de valores', active: true, user: User.first)
    Category.create(title: 'Despesas', active: true, user: User.first)
    Category.create(title: 'Presentes', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Despesas', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Restaurantes', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Furo Caixa', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Saude', active: true, user: User.first)
    Category.create(title: 'Unimed', active: true,
                    category: Category.find_or_create_by!(title: 'Saude'), user: User.first)
    Category.create(title: 'Juros', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Conta Corrente', active: true, user: User.first)
    Category.create(title: 'Banco do Brasil', active: true,
                    category: Category.find_or_create_by!(title: 'Conta Corrente'), user: User.first)
    Category.create(title: 'Pai devedor', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Poupança', active: true, user: User.first)
    Category.create(title: 'Banco do Brasil', active: true,
                    category: Category.find_or_create_by!(title: 'Poupança'), user: User.first)
    Category.create(title: 'Aplicação', active: true, user: User.first)
    Category.create(title: 'Aplicação Sicoob', active: true,
                    category: Category.find_or_create_by!(title: 'Aplicação'), user: User.first)
    Category.create(title: 'Cinema/Filmes', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Equipamentos de Pesca', active: true,
                    category: Category.find_or_create_by!(title: 'Gastos Pessoais'), user: User.first)
    Category.create(title: 'IRPF', active: true,
                    category: Category.find_or_create_by!(title: 'Impostos'), user: User.first)
    Category.create(title: 'IPTU', active: true,
                    category: Category.find_or_create_by!(title: 'Impostos'), user: User.first)
    Category.create(title: 'Alimentação/Bebidas', active: true,
                    category: Category.find_or_create_by!(title: 'Restaurante'), user: User.first)
    Category.create(title: 'Receitas', active: true, user: User.first)
    Category.create(title: 'Salários e Ordenados', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Salário Líquido', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Férias', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Décimo Terceiro', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Despesas', active: true, user: User.first)
    Category.create(title: 'Mercado', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Alimentação', active: true,
                    category: Category.find_or_create_by!(title: 'Mercado'), user: User.first)
    Category.create(title: 'Combustível', active: true, user: User.first)
    Category.create(title: 'Combustível - Carro', active: true,
                    category: Category.find_or_create_by!(title: 'Combustível'), user: User.first)
    Category.create(title: 'Cobustível - Moto', active: true,
                    category: Category.find_or_create_by!(title: 'Combustível'), user: User.first)
    Category.create(title: 'Lazer', active: true, user: User.first)
    Category.create(title: 'Futebol', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'TV a Cabo', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Cinema/Filme', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Doação da Claudia', active: true,
                    category: Category.find_or_create_by!(title: 'Sobradinho'), user: User.first)
    Category.create(title: 'Exames Médicos', active: true,
                    category: Category.find_or_create_by!(title: 'Saúde'), user: User.first)
    Category.create(title: 'Salário Líquido - IFC', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Seguro de Veículo', active: true,
                    category: Category.find_or_create_by!(title: 'Manutenção de Veículo'), user: User.first)
    Category.create(title: 'Diversos', active: true,
                    category: Category.find_or_create_by!(title: 'Impostos'), user: User.first)
    Category.create(title: 'CDI', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Receitas', active: true, user: User.first)
    Category.create(title: 'Salários e Ordenados', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Salário Líquido', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Férias', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Décimo Terceiro', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Despesas', active: true, user: User.first)
    Category.create(title: 'Mercado', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Alimentação', active: true,
                    category: Category.find_or_create_by!(title: 'Mercado'), user: User.first)
    Category.create(title: 'Combustível', active: true, user: User.first)
    Category.create(title: 'Combustível - Carro', active: true,
                    category: Category.find_or_create_by!(title: 'Combustível'), user: User.first)
    Category.create(title: 'Cobustível - Moto', active: true,
                    category: Category.find_or_create_by!(title: 'Combustível'), user: User.first)
    Category.create(title: 'Lazer', active: true, user: User.first)
    Category.create(title: 'Futebol', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'TV a Cabo', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Cinema/Filme', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Sobradinho 2', active: true, user: User.first)
    Category.create(title: 'Compra do Lote', active: true,
                    category: Category.find_or_create_by!(title: 'Sobradinho 2'), user: User.first)
    Category.create(title: 'Acessórios diversos', active: true,
                    category: Category.find_or_create_by!(title: 'Outros'), user: User.first)
    Category.create(title: 'Receita de Vendas e Serviços', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Venda de Mercadorias', active: true,
                    category: Category.find_or_create_by!(title: 'Receita de Vendas e Serviços'), user: User.first)
    Category.create(title: 'Outros', active: true,
                    category: Category.find_or_create_by!(title: 'Internet'), user: User.first)
    Category.create(title: 'OI TV', active: true,
                    category: Category.find_or_create_by!(title: 'TV a Cabo'), user: User.first)
    Category.create(title: 'Sobradinho 2', active: true, user: User.first)
    Category.create(title: 'Compra do Lote', active: true,
                    category: Category.find_or_create_by!(title: 'Sobradinho 2'), user: User.first)
    Category.create(title: 'Lavação', active: true,
                    category: Category.find_or_create_by!(title: 'Outros'), user: User.first)
    Category.create(title: 'Viagem/Hotel', active: true,
                    category: Category.find_or_create_by!(title: 'Outros'), user: User.first)
    Category.create(title: 'Festas', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'DETRAN', active: true,
                    category: Category.find_or_create_by!(title: 'Diversos'), user: User.first)
    Category.create(title: 'Sítio', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Assinaturas Online', active: true,
                    category: Category.find_or_create_by!(title: 'Telefonia'), user: User.first)
    Category.create(title: 'Empréstimos', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Empréstimo recebidos', active: true,
                    category: Category.find_or_create_by!(title: 'Empréstimos'), user: User.first)
    Category.create(title: 'Empréstimos', active: true, user: User.first)
    Category.create(title: 'Empréstimos recebidos', active: true,
                    category: Category.find_or_create_by!(title: 'Empréstimos'), user: User.first)
    Category.create(title: 'Empréstimos a pagar', active: true,
                    category: Category.find_or_create_by!(title: 'Empréstimos'), user: User.first)
    Category.create(title: 'Academia/Natação', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Formatto - Internet', active: true,
                    category: Category.find_or_create_by!(title: 'Internet'), user: User.first)
    Category.create(title: 'Instalações', active: true,
                    category: Category.find_or_create_by!(title: 'Sobradinho'), user: User.first)
    Category.create(title: 'Recebimento Carne', active: true, user: User.first)
    Category.create(title: 'Seguro Residencial', active: true,
                    category: Category.find_or_create_by!(title: 'Sobradinho'), user: User.first)
    Category.create(title: 'Empréstimos a Receber', active: true,
                    category: Category.find_or_create_by!(title: 'Empréstimos'), user: User.first)
    Category.create(title: 'Serviços Prestados', active: true,
                    category: Category.find_or_create_by!(title: 'Receita de Vendas e Serviços'), user: User.first)
    Category.create(title: 'Cartório', active: true,
                    category: Category.find_or_create_by!(title: 'Impostos'), user: User.first)
    Category.create(title: 'Correios/Transportadora', active: true,
                    category: Category.find_or_create_by!(title: 'Serviços Gerais'), user: User.first)
    Category.create(title: 'Cursos/Aperfeiçoamento', active: true,
                    category: Category.find_or_create_by!(title: 'Educação'), user: User.first)
    Category.create(title: 'Imposto de Renda - Restituição', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas Financeiras'), user: User.first)
    Category.create(title: 'Gás', active: true,
                    category: Category.find_or_create_by!(title: 'Sobradinho'), user: User.first)
    Category.create(title: 'Associação ASSIFC', active: true,
                    category: Category.find_or_create_by!(title: 'Saúde'), user: User.first)
    Category.create(title: 'Receitas', active: true, user: User.first)
    Category.create(title: 'Salários e Ordenados', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Salário Líquido', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Férias', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Décimo Terceiro', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Despesas', active: true, user: User.first)
    Category.create(title: 'Mercado', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Alimentação', active: true,
                    category: Category.find_or_create_by!(title: 'Mercado'), user: User.first)
    Category.create(title: 'Combustível', active: true, user: User.first)
    Category.create(title: 'Combustível - Carro', active: true,
                    category: Category.find_or_create_by!(title: 'Combustível'), user: User.first)
    Category.create(title: 'Cobustível - Moto', active: true,
                    category: Category.find_or_create_by!(title: 'Combustível'), user: User.first)
    Category.create(title: 'Lazer', active: true, user: User.first)
    Category.create(title: 'Futebol', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'TV a Cabo', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Cinema/Filme', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Clientes', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Claudia Casagrande', active: true,
                    category: Category.find_or_create_by!(title: 'Clientes'), user: User.first)
    Category.create(title: 'Receitas', active: true, user: User.first)
    Category.create(title: 'Salários e Ordenados', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Salário Líquido', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Férias', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Décimo Terceiro', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Despesas', active: true, user: User.first)
    Category.create(title: 'Mercado', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Alimentação', active: true,
                    category: Category.find_or_create_by!(title: 'Mercado'), user: User.first)
    Category.create(title: 'Combustível', active: true, user: User.first)
    Category.create(title: 'Combustível - Carro', active: true,
                    category: Category.find_or_create_by!(title: 'Combustível'), user: User.first)
    Category.create(title: 'Cobustível - Moto', active: true,
                    category: Category.find_or_create_by!(title: 'Combustível'), user: User.first)
    Category.create(title: 'Lazer', active: true, user: User.first)
    Category.create(title: 'Futebol', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'TV a Cabo', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Cinema/Filme', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Saldo Atualizado', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Agua', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Luz', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Internet', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Cartão Banco do Brasil', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Cartão de Credito', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Cartão Banco do Brasil', active: true,
                    category: Category.find_or_create_by!(title: 'Cartão de Credito'), user: User.first)
    Category.create(title: 'Cartão Sicoob', active: true,
                    category: Category.find_or_create_by!(title: 'Cartão de Credito'), user: User.first)
    Category.create(title: 'Emprestimos/Financiamento', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Financiamento Van', active: true,
                    category: Category.find_or_create_by!(title: 'Emprestimos/Financiamento'), user: User.first)
    Category.create(title: 'Receita Van', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Telefone', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Telefone Fixo - OI', active: true,
                    category: Category.find_or_create_by!(title: 'Telefone'), user: User.first)
    Category.create(title: 'Telefone Movel - Vivo', active: true,
                    category: Category.find_or_create_by!(title: 'Telefone'), user: User.first)
    Category.create(title: 'Dentista', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Odonto exelence', active: true,
                    category: Category.find_or_create_by!(title: 'Dentista'), user: User.first)
    Category.create(title: 'Cartão Sicoob', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Fabricio Bizotto', active: true,
                    category: Category.find_or_create_by!(title: 'Clientes'), user: User.first)
    Category.create(title: 'Saldo Atualizado', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Aplicação', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Talão de Cheque Sicoob', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Emprestimos/Financiamento', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Vestuario', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Saude', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Unimed', active: true,
                    category: Category.find_or_create_by!(title: 'Saude'), user: User.first)
    Category.create(title: 'Uniforme', active: true,
                    category: Category.find_or_create_by!(title: 'Vestuario'), user: User.first)
    Category.create(title: 'Gratificação - Metas', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Bicicleta', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Baile/ Festa', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Farmacia', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Telefone', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Fatura Vivo', active: true,
                    category: Category.find_or_create_by!(title: 'Telefone'), user: User.first)
    Category.create(title: 'Recarga', active: true,
                    category: Category.find_or_create_by!(title: 'Telefone'), user: User.first)
    Category.create(title: 'Limite Conta Corrente', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'IOF', active: true,
                    category: Category.find_or_create_by!(title: 'Limite Conta Corrente'), user: User.first)
    Category.create(title: 'Juros', active: true,
                    category: Category.find_or_create_by!(title: 'Limite Conta Corrente'), user: User.first)
    Category.create(title: 'Alexande de Freitas', active: true,
                    category: Category.find_or_create_by!(title: 'Clientes'), user: User.first)
    Category.create(title: 'Crisitna Casagrande', active: true,
                    category: Category.find_or_create_by!(title: 'Clientes'), user: User.first)
    Category.create(title: 'Presentes', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Nutricionista', active: true,
                    category: Category.find_or_create_by!(title: 'Saude'), user: User.first)
    Category.create(title: 'Faculdade/ Cursos', active: true, user: User.first)
    Category.create(title: 'Inglês', active: true,
                    category: Category.find_or_create_by!(title: 'Faculdade/ Cursos'), user: User.first)
    Category.create(title: 'Faculdade', active: true,
                    category: Category.find_or_create_by!(title: 'Faculdade/ Cursos'), user: User.first)
    Category.create(title: 'PIS/PASEP', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Salario - Adiantamento', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Zumba', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Material de Artesanato', active: true, user: User.first)
    Category.create(title: 'Dentista', active: true,
                    category: Category.find_or_create_by!(title: 'Saude'), user: User.first)
    Category.create(title: 'FGTS', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Sobradinho 2 - Manutenções diversas', active: true,
                    category: Category.find_or_create_by!(title: 'Sobradinho 2'), user: User.first)
    Category.create(title: 'Manutenção', active: true,
                    category: Category.find_or_create_by!(title: 'Combustível'), user: User.first)
    Category.create(title: 'Despesas Buba', active: true, user: User.first)
    Category.create(title: 'Ração', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas Buba'), user: User.first)
    Category.create(title: 'Veterinario', active: true,
                    category: Category.find_or_create_by!(title: 'Ração'), user: User.first)
    Category.create(title: 'Veterinario', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas Buba'), user: User.first)
    Category.create(title: 'Massagens', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Pós-gradução', active: true,
                    category: Category.find_or_create_by!(title: 'Faculdade/ Cursos'), user: User.first)
    Category.create(title: 'Anuidade cartão', active: true,
                    category: Category.find_or_create_by!(title: 'Serviços Gerais'), user: User.first)
    Category.create(title: 'Reserva Financeira da Clau', active: true,
                    category: Category.find_or_create_by!(title: 'Doação'), user: User.first)
    Category.create(title: 'VEICULOS', active: true, user: User.first)
    Category.create(title: 'Compra de Veículo', active: true,
                    category: Category.find_or_create_by!(title: 'VEICULOS'), user: User.first)
    Category.create(title: 'Veiculo', active: true, user: User.first)
    Category.create(title: 'HB20', active: true,
                    category: Category.find_or_create_by!(title: 'Veiculo'), user: User.first)
    Category.create(title: 'Seguro', active: true,
                    category: Category.find_or_create_by!(title: 'Veiculo'), user: User.first)
    Category.create(title: 'ITR', active: true,
                    category: Category.find_or_create_by!(title: 'Impostos'), user: User.first)
    Category.create(title: 'MQM', active: true,
                    category: Category.find_or_create_by!(title: 'Bebidas'), user: User.first)
    Category.create(title: 'Receitas', active: true, user: User.first)
    Category.create(title: 'Salários e Ordenados', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas'), user: User.first)
    Category.create(title: 'Salário Líquido', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Férias', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Décimo Terceiro', active: true,
                    category: Category.find_or_create_by!(title: 'Salários e Ordenados'), user: User.first)
    Category.create(title: 'Despesas', active: true, user: User.first)
    Category.create(title: 'Mercado', active: true,
                    category: Category.find_or_create_by!(title: 'Despesas'), user: User.first)
    Category.create(title: 'Alimentação', active: true,
                    category: Category.find_or_create_by!(title: 'Mercado'), user: User.first)
    Category.create(title: 'Combustível', active: true, user: User.first)
    Category.create(title: 'Combustível - Carro', active: true,
                    category: Category.find_or_create_by!(title: 'Combustível'), user: User.first)
    Category.create(title: 'Cobustível - Moto', active: true,
                    category: Category.find_or_create_by!(title: 'Combustível'), user: User.first)
    Category.create(title: 'Lazer', active: true, user: User.first)
    Category.create(title: 'Futebol', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'TV a Cabo', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Cinema/Filme', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Microcontrolador/Arduino', active: true,
                    category: Category.find_or_create_by!(title: 'Eletrônicos'), user: User.first)
    Category.create(title: 'Livros/Revistas', active: true,
                    category: Category.find_or_create_by!(title: 'Educação'), user: User.first)
    Category.create(title: 'Venda de Veículo', active: true,
                    category: Category.find_or_create_by!(title: 'VEICULOS'), user: User.first)
    Category.create(title: 'Impostos', active: false,
                    category: Category.find_or_create_by!(title: 'Sobradinho 2'), user: User.first)
    Category.create(title: 'Componentes/Computador', active: true,
                    category: Category.find_or_create_by!(title: 'Eletrônicos'), user: User.first)
    Category.create(title: 'Aplicação Financeira', active: true,
                    category: Category.find_or_create_by!(title: 'Receitas Financeiras'), user: User.first)
    Category.create(title: 'Investimentos', active: true, user: User.first)
    Category.create(title: 'Previdência Privada', active: true,
                    category: Category.find_or_create_by!(title: 'Investimentos'), user: User.first)
    Category.create(title: 'Animais', active: true, user: User.first)
    Category.create(title: 'Veterinário', active: true,
                    category: Category.find_or_create_by!(title: 'Animais'), user: User.first)
    Category.create(title: 'Acampamento', active: true,
                    category: Category.find_or_create_by!(title: 'Lazer'), user: User.first)
    Category.create(title: 'Aposentadoria Aplicação', active: true,
                    category: Category.find_or_create_by!(title: 'Outros'), user: User.first)
    Category.create(title: 'Cartório', active: true, user: User.first)
    Category.create(title: 'Buba', active: true,
                    category: Category.find_or_create_by!(title: 'Outros'), user: User.first)
  rescue StandardError => e
    binding.pry
    puts e
  end
end
