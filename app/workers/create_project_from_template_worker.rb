class CreateProjectFromTemplateWorker
    include Sidekiq::Worker
    sidekiq_options retry: false
    def perform(package_type_id, user_id)
      package_type = PackageType.find(package_type_id)
      user = User.find(user_id)
      @project = package_type.create_project user, Date.today + 30.days
    end
end
