/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('fichamedica', {
    ID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    ID_Alumno: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'alumno',
        key: 'ID'
      }
    }
  }, {
    tableName: 'fichamedica',
	timeStamps: false
  });
};
