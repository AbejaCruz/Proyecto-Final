require 'rubyXL'
namespace :departments do
  desc "TODO"
  task seed: :environment do
    workbook = RubyXL::Parser.parse("#{Rails.root}/lib/tasks/departamentos_municipios.xlsx")
    workbook[1].each_with_index do |row, index|
      if index > 6
        Department.create(name: row.cells[1].value) if row.cells[1] != nil
      end
    end
    workbook[0].each_with_index do |row, index|
      if index > 5 && row.cells[1] != nil && row.cells[3] != nil
        department = Department.where(name: row.cells[1].value).first
        City.create(name:row.cells[3].value, department_id: department.id)
      end
    end
  end
end
