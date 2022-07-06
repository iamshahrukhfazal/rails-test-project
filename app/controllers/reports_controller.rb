# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_report, only: %i[destroy]

  def create
    authorize Report
    @report = current_user.reports.new(report_params)
    respond_to do |format|
      if @report.save
        @post = @report.reportable
      else
        format.html { render :new, status: :unprocessable_entity }
      end
      format.js
    end
  end

  def destroy
    authorize Report
    @post = @report.reportable
    @report.destroy
    respond_to do |format|
      format.js
    end
  end

  def all_reported_post
    authorize Report
    @reported_posts = Report.remove_post_duplicate
  end

  def all_reported_comment
    authorize Report
    @reported_comments = Report.remove_comment_duplicate
  end

  private

  def set_report
    @report = current_user.reports.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:reportable_id, :reportable_type, :report_status)
  end
end
