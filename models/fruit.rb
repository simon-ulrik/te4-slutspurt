class Fruit
  # Connects to the database
  #
  # @return db [Object]
  def self.db
    @db = Sequel.connect('postgres://security:qwerty@0.0.0.0:5432/simons_super_secure_db')
  end

  # Fetches all fruits from the database
  #
  # @return [Array of Hash]
  def self.get_all()
    db.fetch('SELECT * FROM fruits').all
  end

  # Fetches a fruit depending on a specified column and a value
  #
  # @param [Hash] =>
  #  exaples:
  #   Fruit.get(id: 1) #=> {id: 1, name: "Banana", description: "it's a banana", rating: 5.0}
  #   Fruit.get(name: "Banana") #=> {id: 1, name: "Banana", description: "it's a banana", rating: 5.0}
  # @return [hash]
  def self.get(get_hash)
    column_name = get_hash.keys[0]
    value = get_hash[column_name]
    db.fetch('SELECT * FROM fruits WHERE ? = ?', column_name, value)[:@db]
  end

  # Delets a fruit depending on a specified column and a value
  #
  # @param [Hash] =>
  #  exaple:
  #   Fruit.delete(id: 1) #=> nil
  # @return [Object]
  def self.delete(delete_hash)
    column_name = delete_hash.keys[0]
    value = delete_hash[column_name]
    db.fetch('DELETE FROM fruits WHERE ? = ?', column_name, value)
  end

  # Updates a fruit specified by a column and a value depending on a specified column and a value
  #
  # @param [Hash] =>
  #  exaple:
  #   Fruit.update(id: 1, rating: 7.5) #=> nil
  # @return [Object]
  def self.update(update_hash)
    find_column = update_hash.keys[0]
    change_column = update_hash.keys[1]
    db.fetch(
      'UPDATE fruits SET ? = ? WHERE ? = ?',
      change_column,
      update_hash[change_column],
      find_column,
      update_hash[find_column]
    )
  end

  # Creates a fruit specified by columns and values
  #
  # @param [Hash] =>
  #  exaple:
  #   Fruit.create(name: "Åpple", description: "it's an Åpple", rating: "10.0") #=> nil
  # @return [Object]
  def self.create(new_hash)
    db.fetch(
      'INSERT INTO fruits(name, description, rating) VALUES (?, ?, ?)',
      new_hash[:name],
      new_hash[:description],
      new_hash[:rating]
    )
  end
end
