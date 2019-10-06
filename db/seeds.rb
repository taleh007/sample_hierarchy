# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
SitePoint.roots.each(&:destroy)

home = SitePoint.create(name: 'Home', path: '/')
settings = SitePoint.create(name: 'Settings', path: 'settings', parent: home)
company_profile = SitePoint.create(name: 'Company Profile', path: 'company_profile', parent: settings)
help_p = SitePoint.create(name: 'Help', path: 'help', parent: settings)
tickets = SitePoint.create(name: 'Tickets', path: 'tickets', parent: help_p)
create_ticket = SitePoint.create(name: 'Create A Ticket ', path: 'create', parent: tickets)
faq = SitePoint.create(name: 'FAQ', path: 'faqs', parent: help_p)
