require 'rails_helper'
require_relative '../support/devise'

RSpec.describe ReportsController, type: :controller do
    describe "GET /" do
      login_user
      let!(:user_post) { FactoryBot.create(:post) }
      let!(:user_report) { FactoryBot.create(:report,reportable_id: user_post.id) }
      let!(:params) { { report: { reportable_type: "Post", reportable_id: user_post.id, report_status: "under18"}}}

      

      describe 'Report #create' do

        before do
          post :create, params: params, format:'js'
        end

        context 'when params are not correct' do
        
          it 'is expected to create new post successfully' do
            expect((assigns[:report])).to be_instance_of(Report)
          end
          
          it 'is expected to have user_id assigned to it' do
            expect(assigns[:report].user_id).to eq(subject.current_user.id)
          end

          it 'is expected to have status assigned to it' do
            expect(assigns[:report].report_status).to eq(params[:report][:report_status])
          end
          it 'is expected to have type assigned to it' do
            expect(assigns[:report].reportable_type).to eq(params[:report][:reportable_type])
          end

          it 'is expected to have type assigned to it' do
            expect(assigns[:post]).to be_instance_of(Post || Comment)
          end

          it 'is expected to add report status attribute' do
            expect(assigns[:report].report_status).to eq("under18")
          end

        end

        context 'when params are correct' do

          let!(:params) { { report: { reportable_type: "Post", reportable_id: user_post.id}}}
        
          it 'is expected to create new post successfully' do
            expect((assigns[:report])).to be_instance_of(Report)
          end
          
          it 'is expected to have user_id assigned to it' do
            expect(assigns[:report].user_id).to_not eq(123)
          end

          it 'is expected to have user_id assigned to it' do
            expect(assigns[:report].user_id).to_not eq(123)
          end

        end

        context 'Invalid Reportable_type' do

          let!(:params) { { report: { reportable_type: "User", reportable_id: user_post.id}}}
  
          it 'is expected to fail create new Report successfully' do
            expect((assigns[:report])).to be(nil)
          end
        end

        context 'Invalid Reportable_id' do

          let!(:params) { { report: { reportable_type: "Post", reportable_id: 32}}}
  
          it 'is expected to fail create new Report successfully' do
            expect((assigns[:report])).to be(nil)
          end

        end
      end

      it 'Destroy action response' do

        delete :destroy, params: {id: user_report.id}, format:'js'
        expect(Report.find_by(id: user_report.id)).to be_nil
      end

      it 'Destroy Fail action response' do
          delete :destroy, params: {id: 2345}, format:'js'
          expect(Report.find_by(id: user_report.id)).to_not be_nil
      end
  end
end
