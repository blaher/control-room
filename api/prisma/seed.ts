import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()
async function main() {
  await prisma.workoutType.upsert({
    where: {name: 'Walk'},
    update: {},
    create: {
      name: 'Walk'
    }
  })
  await prisma.workoutType.upsert({
    where: {name: 'Run'},
    update: {},
    create: {
      name: 'Run',
      Target: {
        create: {
          name: 'Endurance'
        }
      }
    }
  })
  await prisma.workoutType.upsert({
    where: {name: 'Cycle'},
    update: {},
    create: {
      name: 'Cycle'
    }
  })
  await prisma.workoutType.upsert({
    where: {name: 'Tennis'},
    update: {},
    create: {
      name: 'Tennis'
    }
  })

  await prisma.workoutType.upsert({
    where: {name: 'Curl'},
    update: {},
    create: {
      name: 'Curl',
      Target: {
        create: {
          name: 'Bicep'
        }
      }
    }
  })
  await prisma.workoutType.upsert({
    where: {name: 'Extension'},
    update: {},
    create: {
      name: 'Extension',
      Target: {
        create: {
          name: 'Tricep'
        }
      }
    }
  })
  await prisma.workoutType.upsert({
    where: {name: 'Lift'},
    update: {},
    create: {
      name: 'Lift',
      Target: {
        create: {
          name: 'Shoulder'
        }
      }
    }
  })
  await prisma.workoutType.upsert({
    where: {name: 'Bench'},
    update: {},
    create: {
      name: 'Bench',
      Target: {
        create: {
          name: 'Pec'
        }
      }
    }
  })
  await prisma.workoutType.upsert({
    where: {name: 'Row'},
    update: {},
    create: {
      name: 'Row',
      Target: {
        create: {
          name: 'Back'
        }
      }
    }
  })
  await prisma.workoutType.upsert({
    where: {name: 'Squat'},
    update: {},
    create: {
      name: 'Squat',
      Target: {
        create: {
          name: 'Quad'
        }
      }
    }
  })
}
main()
  .catch(e => {
    console.error(e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
