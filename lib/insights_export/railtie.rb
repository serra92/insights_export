module InsightsExport
  class Railtie < Rails::Railtie
    rake_tasks do
      namespace :insights do
        desc 'Export database structure to config/insights.yml'
        task export: :environment do
          Rails.application.eager_load!
          InsightsExport::ExportModels.export
        end
        desc 'Set exporter to ignore models'
        task :ignore, :ignore_list do |_t, args|
          # Rails.application.eager_load!
          InsightsExport::ExportModels.ignore(args[:ignore_list])
        end
      end
    end
  end
end
