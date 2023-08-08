class ReactionsController < ApplicationController
    before_action :authenticate_user!
  
    def user_reaction
        def user_reaction
            @user = current_user
            @publication = Publication.find(params[:publication_id])
            reaction = Reaction.find_by(user_id: @user.id, publication_id: @publication.id)
                if reaction
                    return flash.now[:alert] = 'You already reacted to this product'
                else
                    @new_reaction = Reaction.new(user_id: @user.id, publication_id: @publication.id, kind: params[:kind])
                        respond_to do |format|
                                        if @new_reaction.save!
                                            format.html { redirect_to publication_path(@publication), notice: "#{current_user.email} has stated that it #{@new_reaction.kind}
                                        the product" }
                                        else
                                            format.html { redirect_to publication_path(@publication), status: :unprocessable_entity }
                                        end
                                    end
                end
        end
    end
  
        def publication_with_reactions
            @reactions = current_user.reactions
            publication_ids = @reactions.map(&:publication_id)
            @publications = Publication.where(id: publication_ids)
        end
end
