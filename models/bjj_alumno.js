/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('bjj_alumno', {
    ID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    competidor: {
      type: 'BIT(1)',
      allowNull: false
    },
    grado: {
      type: DataTypes.INTEGER(3),
      allowNull: false
    },
    ID_Cinta: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'bjj_cinta',
        key: 'ID'
      }
    },
    ID_TallaKimono: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'bjj_tallakimono',
        key: 'ID'
      }
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
    tableName: 'bjj_alumno',
	timeStamps: false
  });
};
