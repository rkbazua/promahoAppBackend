/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('alumno', {
    ID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    nombre: {
      type: DataTypes.STRING,
      allowNull: false
    },
    apellidoPaterno: {
      type: DataTypes.STRING,
      allowNull: false
    },
    apellidoMaterno: {
      type: DataTypes.STRING,
      allowNull: false
    },
    direccion: {
      type: DataTypes.STRING,
      allowNull: false
    },
    telefono: {
      type: DataTypes.INTEGER(10),
      allowNull: false
    },
    foto: {
      type: DataTypes.STRING,
      allowNull: false
    },
    codigo: {
      type: DataTypes.STRING,
      allowNull: false
    },
    estatura: {
      type: 'DOUBLE',
      allowNull: false
    },
    peso: {
      type: 'DOUBLE',
      allowNull: false
    },
    genero: {
      type: DataTypes.STRING,
      allowNull: false
    },
    fechaAfiliacion: {
      type: DataTypes.DATE,
      allowNull: false
    },
    fechaNacimiento: {
      type: DataTypes.DATE,
      allowNull: false
    },
    activo: {
      type: 'BIT(1)',
      allowNull: false,
      defaultValue: 1
    },
    ID_USUARIO: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      defaultValue: '1'
    },
    referido: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      defaultValue: '1'
    }
  }, {
    tableName: 'alumno',
	timeStamps: false
  });
};
