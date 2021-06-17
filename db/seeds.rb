# This is not the place for test data
# Only use this to put the necessary setup for the app to work
# Separate the seeds in different Seed Service Objects
# The data can then be loaded with the rails db:seed command

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
