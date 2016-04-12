/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('enfermedades', {
    ID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true
    },
    enfermedad: {
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
    tableName: 'enfermedades',
	timeStamps: false
  });
};
