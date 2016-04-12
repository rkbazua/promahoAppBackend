/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('alergias', {
    ID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true
    },
    alergia: {
      type: DataTypes.STRING,
      allowNull: false
    },
    ID_FICHA_MEDICA: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'fichamedica',
        key: 'ID'
      }
    }
  }, {
    tableName: 'alergias',
	timeStamps: false
  });
};
