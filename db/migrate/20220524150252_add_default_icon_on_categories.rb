class AddDefaultIconOnCategories < ActiveRecord::Migration[7.0]
  def change
    change_column :categories, :icon, :string, default: 'https://icon2.cleanpng.com/20180216/gaw/kisspng-question-mark-clip-art-question-mark-images-5a87a71b595fd8.4163604515188395793661.jpg'
  end
end
