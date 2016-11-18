15.times do
	client = Client.new
	client.name = Faker::Name.first_name
	client.company = Faker::Company.name
	client.email = Faker::Internet.free_email(client.name)
	client.mobile = Faker::Number.number(10)
	client.website = Faker::Internet.domain_name
	client.save
end 

100.times do 
	project = Project.new
	project.name = Faker::App.name
	project.description = Faker::Lorem.sentence
	project.start_date = Faker::Date.between(Date.today.beginning_of_year, Date.today)
	project.end_date = Faker::Date.between(project.start_date, project.start_date + 3.months)
	project.client_id = Client.all.pluck(:id).sample
	project.save
end 

200.times do 
	task = Task.new
	task.title = Faker::App.name 
	task.project_id = Project.all.pluck(:id).sample
	task.due_date = Faker::Date.between(Date.today, Date.today + 2.months)
	task.is_complete = Faker::Boolean.boolean(0.2)
	task.save
end 

10.times do 
	category = Category1.new
	category.name = Faker::Commerce.product_name 
	category.save
end 

100.times do 
	product = Product1.new
	product.name = Faker::Commerce.product_name
	product.price = Faker::Commerce.price
	product.unit = Faker::Number.between(1, 20)
	product.in_stock = Faker::Boolean.boolean
	product.available_from = Faker::Date.between(Date.today.beginning_of_year, Date.today)
	product.category = Category1.all.pluck(:id).sample
	product.save
end 


100.times do 
	city = City.new
	city.name = Faker::Address.city
	city.save
end 

150.times do 
	locality = Locality.new
	locality.name = Faker::Address.street_name
	locality.city_id = City.all.pluck(:id).sample
	locality.save
end

200.times do 
	user = User.new
	user.name = Faker::Name.name
	user.email = Faker::Internet.free_email
	user.password = Faker::Internet.password
	user.mobile = Faker::Number.number(10)
	user.user_type = ['owner', 'tenant'].sample
	user.save
end  

200.times do 
	properity = Properity.new
	properity.user_id = User.all.pluck(:id).sample 
	properity.name = Faker::Company.name
	properity.address = Faker::Address.street_address
	properity.locality_id = Locality.all.pluck(:id).sample
	properity.city_id = City.all.pluck(:id).sample
	properity.properity_type = ['Flat', 'Independent house', 'PG For Gents', 'PG For Ladies'].sample
	properity.area = Faker::Address.street_name
	properity.price = ['10000', '6500', '23000', '7500', '15000'].sample
	properity.advance_amount = ['50000', '100000', '4000', '60000', '7000', '30000', '6000'].sample
	properity.description = Faker::Lorem.sentence
	properity.availability = ['Available', 'Not Available', 'Soon Will Available'].sample
	properity.image_url = Faker::Placeholdit.image
	properity.save
end 

150.times do 
	propreview = Propreview.new
	propreview.user_id = User.all.pluck(:id).sample
	propreview.rev_desc = Faker::Lorem.sentence
	propreview.properity_id = Properity.all.pluck(:id).sample
	propreview.rating = ['*****', '****','***', '**', '*'].sample
	propreview.save
end 

30.times do
	requirement = Requirement.new
	requirement.min_area = ['600sqft', '800sqft', '1000sqft', '1200sqft'].sample
	requirement.max_area = ['1400sqft', '1500sqft', '1600sqft', '1700sqft'].sample
	requirement.locality_id = Locality.all.pluck(:id).sample
	requirement.city_id = City.all.pluck(:id).sample
	requirement.min_price = ['10000', '11000', '12000', '13000', '14000'].sample
	requirement.max_price = ['14000', '15000', '16000', '17000', '18000'].sample
	requirement.avaliability = SELECT * FROM properities WHERE availability = 'Availability' 
end 


