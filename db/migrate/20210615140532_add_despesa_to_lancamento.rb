class AddDespesaToLancamento < ActiveRecord::Migration[6.0]
  def up
    add_column :lancamentos, :despesa, :boolean, null: true
    change_column_default :lancamentos, :despesa, true
  end

  def down
    remove_column :lancamentos, :despesa
  end

  
end
