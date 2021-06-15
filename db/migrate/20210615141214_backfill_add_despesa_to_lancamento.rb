class BackfillAddDespesaToLancamento < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def up
    Lancamento.unscoped.in_batches do |relation| 
      relation.update_all despesa: true
      sleep(0.01)
    end
  end

end
