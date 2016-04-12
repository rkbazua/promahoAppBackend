/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('rol', {
    ID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true
    },
    rol: {
      type: DataTypes.STRING,
      allowNull: true
    }
  }, {
    tableName: 'rol',
	timeStamps: false
  });
};
