const { PrismaClient, Prisma } = require("@prisma/client");

const prisma = new PrismaClient();

module.exports.create = function create(code, name, credit) {
  return prisma.module
    .create({
      // TODO: Add data
      data: {
        modCode: code,
        modName: name,
        creditUnit: Number(credit),
      },
    })
    .then(function (module) {
      // TODO: Return module
      return module;
    })
    .catch(function (error) {
      // Prisma error codes: https://www.prisma.io/docs/orm/reference/error-reference#p2002
      // TODO: Handle Prisma Error, throw a new error if module already exists

      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        if (error.code === "P2002") {
          throw new Error("this module already existed!");
        }
        throw new Error(
          `Internal server error. Prisma error ${error.code}: ${error.message}`,
        );
      }
    });
};

module.exports.updateByCode = function updateByCode(code, credit) {
  return prisma.module
    .update({
      // TODO: Add where and data
      where: {
        modCode: code,
      },
      data: {
        creditUnit: Number(credit),
      },
    })
    .then(function (module) {
      // Leave blank
    })
    .catch(function (error) {
      // Prisma error codes: https://www.prisma.io/docs/orm/reference/error-reference#p2025
      // TODO: Handle Prisma Error, throw a new error if module is not found
      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        if (error.code === "P2025") {
          throw new Error("No such module exist!");
        }
        throw new Error(
          `Internal server error. Prisma error ${error.code}: ${error.message}`,
        );
      }
      throw error;
    });
};

module.exports.deleteByCode = function deleteByCode(code) {
  return prisma.module
    .delete({
      // TODO: Add where
      where: {
        modCode: code,
      },
    })
    .then(function (module) {
      // Leave blank
    })
    .catch(function (error) {
      // Prisma error codes: https://www.prisma.io/docs/orm/reference/error-reference#p2025
      // TODO: Handle Prisma Error, throw a new error if module is not found
      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        if (error.code === "P2025") {
          throw new Error("No such module exist!");
        }
        throw new Error(
          `Internal server error. Prisma error ${error.code}: ${error.message}`,
        );
      }
    });
};

module.exports.retrieveAll = function retrieveAll() {
  // TODO: Return all modules
  return prisma.module.findMany();
};

module.exports.retrieveByCode = function retrieveByCode(code) {
  return prisma.module
    .findUnique({
      where: {
        modCode: code,
      },
    })
    .then(function (module) {
      if (!module) {
        throw new Error("No such module exists!");
      }
      return module;
    })
    .catch(function (error) {
      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        throw new Error(
          `Internal server error. Prisma error ${error.code}: ${error.message}`,
        );
      }
      throw error;
    });
};
