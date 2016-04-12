/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('asistencia', {
    ID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true
    },
    fecha: {
      type: DataTypes.DATE,
      allowNull: false
    },
    entrada: {
      type: DataTypes.DATE,
      allowNull: false
    },
    salida: {
      type: DataTypes.DATE,
      allowNull: false
    },
    ID_Alumno: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'alumno',
        key: 'ID'
      }
    }
  }, {
    tableName: 'asistencia',
	timeStamps: false
  });
};
