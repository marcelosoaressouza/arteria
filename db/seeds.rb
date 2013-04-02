# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

role_admin = Role.create! :name => 'admin'
role_guest = Role.create! :name => 'guest'

user_admin = User.create! :email => 'admin@localhost.org',
                          :firstname => 'Admin',
                          :lastname => 'Localhost',
                          :password => '123456',
                          :password_confirmation => '123456'

user_admin.add_role    :admin
user_admin.remove_role :guest

license = License.create! :name => 'CC BY 3.0 BR',
                          :description => 'Compartilhar - copiar, distribuir e transmitir a obra. Remixar - criar obras derivadas. Fazer uso comercial da obra'

about = Post.create! :title => 'Sobre',
                     :content => 'Put here something about you site...',
                     :published => true,
                     :license_id => 1,
                     :user_id => 1
