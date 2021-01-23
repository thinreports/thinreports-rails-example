class BaseReport
  def generate
    build
    report.generate
  end

  private

  attr_reader :report

  def report
    @report ||= Thinreports::Report.new layout: template_path
  end

  def template_path
    Rails.root.join('app', 'reports', 'templates', template_name)
  end

  def template_name
    raise NotImplementedError
  end
end
