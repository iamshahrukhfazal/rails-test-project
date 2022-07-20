require 'rails_helper'
require_relative '../support/devise'

RSpec.describe PostsController, type: :controller do
    describe "GET /" do
        login_user
        let!(:user_post) { FactoryBot.create(:post) }

        let!(:user_posts) { FactoryBot.create_list(:post,5) }

        let!(:params) { { post: { content: "<div>Game</div>", title: "Content For Post"}}}

        describe "Post Index" do
            before do
                get :index
            end

            context 'index' do

                it 'is expected to get all post ' do
                    expect(assigns[:posts].length).to be(6)
                end
        
                it 'is expected to render index template' do
                    is_expected.to render_template(:index)
                end

                it 'should return 200:OK' do
                    get :index
                    expect(response).to have_http_status(:success)
                end
                
            end
        end
  
        describe 'GET #new' do
          before do
            get :new
          end

          it 'is expected to assign post Comment as new instance variable' do
            expect((assigns[:post])).to be_instance_of(Post)
          end
          
          it 'should return 200:OK' do
            expect(response).to have_http_status(:success)
          end

          it 'renders new template' do
            is_expected.to render_template(:new)
          end
    
          it 'renders application layout' do
            is_expected.to render_template(:application)
          end

        end


        describe 'POST #create' do

            before do
              post :create, params: params
            end
    
            context 'when params are correct' do
            
              it 'is expected to create new post successfully' do
                expect((assigns[:post])).to be_instance_of(Post)
              end

              it 'should return 200:OK' do
                get :new
                expect(response).to have_http_status(:success)
              end
    
              it 'is expected to have user_id assigned to it' do
                expect(assigns[:post].user_id).to eq(subject.current_user.id)
              end

              it 'is expected to have title assigned to it' do
                expect(assigns[:post].title).to eq(params[:post][:title])
              end
    
              it 'renders new template' do
                is_expected.to render_template(:new)
              end
        
              it 'renders application layout' do
                is_expected.to render_template(:application)
              end
            end
            
            context 'when params are not correct' do
                let(:params) { { post: { content: "<div>Game</div>", title: ''}}}

                it 'is expected to render new template' do
                  is_expected.to render_template(:new)
                end
        
                it 'is expected to add errors to name attribute' do
                  expect(assigns[:post].errors[:title]).to eq(['can\'t be blank'])
                end
              end
        end

            # edit action
        describe 'GET #edit' do
            before do
                patch :update, params: { id: user_post.id, post: { content: "<div>Update Context</div>", title: user_post.title} }
            end
    
            context 'when post id and Data is valid' do
        
                it 'is expected to set post instance variable' do
                    expect(assigns[:post]).to eq(Post.find_by(id: user_post.id))
                end
        
                it 'is expected post params title and post title matches' do
                    expect(assigns[:post].title).to eq(params[:post][:title])
                end 
            end
        end

        describe 'GET #edit' do
            before do
                patch :update, params: { id: user_post.id, post: { content: "<div>Update Context</div>", title: ""} }, format: 'js'
            end

            context 'when post id and Data is not valid valid' do

                it 'is expected to set post instance variable' do
                    expect(assigns[:post]).to_not eq(Post.find_by(id: 1231231231))
                end
        
                it 'is expected post params title and post title not matched matches' do
                    expect(assigns[:post].title).to_not eq('testing')
                end

                it 'is expected to add errors to title attribute' do
                    expect(assigns[:post].errors[:title]).to eq(['can\'t be blank'])
                end
                
            end
        end

       

        it 'Post User Create action response' do
            expect { post :create, params: { post: { content: "<div>Game</div>", title: 'Contents'}}}.to change(Post, :count).by(1)
        end


        it 'Destroy action response' do
            delete :destroy, params: { id: user_post.id }, format: 'js'
            expect(Post.find_by(id: user_post.id)).to be_nil
        end

        it 'Destroy action response' do
            delete :destroy, params: { id: 3242342 }, format: 'js'
            expect(Post.find_by(id: user_post.id)).to_not be_nil
        end
    end
end
