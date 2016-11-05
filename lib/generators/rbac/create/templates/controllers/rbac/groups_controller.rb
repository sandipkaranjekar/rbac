module Rbac
  class GroupsController < ApplicationController
    before_action :set_group, only: [:show, :edit, :update, :destroy]

    # GET /groups
    # GET /groups.json
    def index
      @groups = Rbac::Group.all
    end

    # GET /groups/1
    # GET /groups/1.json
    def show
    end

    # GET /groups/new
    def new
      @group = Rbac::Group.new
      @privileges = Rbac::Privilege.all
    end

    # GET /groups/1/edit
    def edit
      @group_privileges = @group.privileges
      @privileges = Rbac::Privilege.all
    end

    # POST /groups
    # POST /groups.json
    def create
      @group = Rbac::Group.new(group_params)

      respond_to do |format|
        if @group.save
          @group.privileges = Rbac::Privilege.where(id: params[:privilege_ids])
          format.html { redirect_to rbac_groups_path, notice: 'Group was successfully created.' }
          format.json { render :show, status: :created, location: @group }
        else
          format.html { redirect_to new_rbac_group_path }
          format.json { render json: @group.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /groups/1
    # PATCH/PUT /groups/1.json
    def update
      respond_to do |format|
        if @group.update(group_params)
          @group.privileges = Rbac::Privilege.where(id: params[:privilege_ids])
          format.html { redirect_to rbac_groups_path, notice: 'Group was successfully updated.' }
          format.json { render :show, status: :ok, location: @group }
        else
          format.html { redirect_to edit_rbac_group_path }
          format.json { render json: @group.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /groups/1
    # DELETE /groups/1.json
    def destroy
      @group.destroy
      respond_to do |format|
        format.html { redirect_to rbac_groups_url, notice: 'Group was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_group
        @group = Rbac::Group.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def group_params
        params.require(:rbac_group).permit(:name, :description, :privilege_ids, :is_active)
      end
  end
end
