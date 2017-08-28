class InvitesController < ApplicationController
  def invite
    vars = request.query_parameters
    @invited_cohort = vars[:cohort]
    session[:invited_cohort] = @invited_cohort
    @cohort = Cohort.find(session[:invited_cohort])
  end
end
