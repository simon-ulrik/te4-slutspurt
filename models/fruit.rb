class Fruit
  def self.db
    @db = Sequel.connect('postgres://security:qwerty@0.0.0.0:5432/simons_super_secure_db')
  end

  def self.get_all
    db.fetch('SELECT * FROM fruits').all
  end

  def self.get(get_hash)
    column_name = get_hash.keys[0]
    value = get_hash[column_name]
    db.fetch('SELECT * FROM fruits WHERE ? = ?', column_name, value)[:@db]
  end

  def self.delete(delete_hash)
    column_name = delete_hash.keys[0]
    value = delete_hash[column_name]
    db.fetch('DELETE FROM fruits WHERE ? = ?', column_name, value)[:@db]
  end

  def self.update(update_hash)
    find_column = update_hash.keys[0]
    find_value = update_hash[find_column]

    db.fetch(
      'UPDATE fruits SET rating = ? WHERE ? = ?',
      # update_hash[:feild].to_s,
      # update_hash[:new_value].to_s,
      update_hash[:new_value],
      find_column,
      find_value
    )[:@db]
  end

  def self.create()
  end
end
