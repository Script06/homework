require_relative '1_methods'
people = File.open("People.txt")
#index(people)
#find(people, 2)
where(people, 'глеб')
#update(people, 3, 'Артур Пирожков 45')
#delete(people, 3)
#create(people, 'Даниэль Пирожков 13')
people.close
