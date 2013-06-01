# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

moc_codes = [{moc_code: '3D054', name: 'Computer Programming - Air Force Enlisted'},
{moc_code: '62E3C', name: 'Developmental Engineer - Computer System - Air Force Officer'},
{moc_code: '94F', name: 'Computer Detection Systems Repairer - Army Enlisted'},
{moc_code: '24A', name: 'Telecommunications Systems Engineer - Army Officer'},
{moc_code: '3529', name: 'Motor Transport Maintenance Chief - Marine Enlisted'},
{moc_code: '3500', name: 'Basic Motor Transport Marine - Marine Enlisted'},
{moc_code: '1978', name: 'Supply Logistics Officer - Navy Officer'},
{moc_code: '2829', name: 'Relational Supply Unit Technical Support - Navy Officer'}]

moc_codes.each do |code|
  if !MocCode.find_by_moc_code(code[:moc_code]) then
    MocCode.create(moc_code: code[:moc_code], name: code[:name])
  end
end 