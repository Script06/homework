class MarksController < ApplicationController
  def show
    
  end

  def create
    @lab_report = LabReport.find(params[:id])
    @lab_report.update(

      grade: params[:grade]
    )

    redirect_to lab_reports_path
  end
end
