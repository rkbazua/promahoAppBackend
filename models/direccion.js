/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('direccion', {
    ID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    direccion: {
      type: DataTypes.STRING,
      allowNull: false
    },
    ID_Academia: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'academia',
        key: 'ID'
      }
    }
  }, {
    tableName: 'direccion',
	timeStamps: false
  });
};
