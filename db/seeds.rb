Contact.destroy_all

Contact.create!([
  { name: "Ana Souza", email: "ana@email.com", phone: "85988887777", favorite: true },
  { name: "Bruno Lima", email: "bruno@email.com", phone: "85977776666", notes: "Cliente do projeto X" },
  { name: "Carla Mendes", email: "carla@email.com", phone: "85966665555", favorite: true },
  { name: "Daniel Rocha", email: "daniel@email.com", phone: "85955554444" },
  { name: "Eduarda Pinto", email: "eduarda@email.com", phone: "85944443333", notes: "Retornar ligação" }
])

puts "#{Contact.count} contacts created"