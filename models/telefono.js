/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('telefono', {
    ID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    telefono: {
      type: DataTypes.INTEGER(10),
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
    tableName: 'telefono',
	timeStamps: false
  });
};
