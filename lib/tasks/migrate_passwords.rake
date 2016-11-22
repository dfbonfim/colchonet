# encoding: utf-8

namespace :app do 
	desc 'Escripta as senhas ja salvas no banco'
	task migrate_passwords: :environment do

		unless User.attribute_names.include? "password"
			puts "As senhas j´a foram migradas"
			return
		end
		
		User.find_each do |user|
			puts "Migrando usuario #{user.id} #{user.full_name}"
			unencripted_password = user.password
			puts "A senha e #{unencripted_password}"
			user.password = unencripted_password
			user.password_confirmation = unencripted_password
			if !unencripted_password.nil? then
				user.save!
			end
		end	
	end
end