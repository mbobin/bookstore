class ProcessFileJob < ApplicationJob
  def perform(filepath)
    Version::Create.({}, filepath: filepath)
  end
end
